--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Data.String (IsString)
import           Hakyll
import qualified Text.Pandoc.Options as Options


cslFile :: (IsString s) => s
cslFile = "csl/apa.csl"
bibFile :: (IsString s) => s
bibFile = "ref.bib"

mathJaxUrl :: (IsString s) => s
mathJaxUrl = "https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_CHTML"

myPandocBiblioCompiler :: Compiler (Item String)
myPandocBiblioCompiler = do
    csl <- load cslFile
    bib <- load bibFile
    let writerOptions = defaultHakyllWriterOptions
          { Options.writerHTMLMathMethod = Options.MathJax mathJaxUrl }
          { Options.writerTOCDepth = 2 }
    getResourceBody >>=
        readPandocBiblio defaultHakyllReaderOptions csl bib >>=
        return . writePandocWith writerOptions

mathCtx :: Context a
mathCtx = field "mathjax" $ \item -> do
    metadata <- getMetadata $ itemIdentifier item
    return $ case lookupString "mathjax" metadata of
      Just v | v `elem` ["on", "true"] ->
               mconcat
               [ "<script type=\"text/javascript\" src=\""
               , mathJaxUrl
               , "\"></script>"
               ]
      Just v -> error (mconcat ["Unknown value '", v, "' for mathjax"])
      Nothing -> ""

--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
    match cslFile $ compile cslCompiler
    match bibFile $ compile biblioCompiler

    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
        route   idRoute
        compile compressCssCompiler

    match (fromList ["about.rst", "contact.markdown"]) $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    -- TODO Generate this file
    match "elm.min.js" $ do
        route   idRoute
        compile copyFileCompiler

    match (fromList ["greeknumeral.md"]) $ do
        let grcnumCtx =
                mathCtx `mappend`
                defaultContext
        route   $ setExtension "html"
        compile $ myPandocBiblioCompiler
            >>= loadAndApplyTemplate "templates/default.html" grcnumCtx
            >>= relativizeUrls

    match "posts/*" $ do
        route $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html"    postCtx
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls

    create ["archive.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Archives"            `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls


    match "index.md" $ do
        route   $ setExtension "html"
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let indexCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Home"                `mappend`
                    defaultContext

            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= renderPandoc
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls

    match "templates/*" $ compile templateCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
    dateField "date" "%B %e, %Y" `mappend`
    defaultContext

