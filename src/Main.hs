{-# LANGUAGE DeriveGeneric #-}

import qualified Data.ByteString.Char8 as BS
import qualified Data.Yaml as Y
import GHC.Generics
import Data.Aeson


data Cred = Cred { username :: String, password :: String } deriving (Show, Generic)
instance FromJSON Cred

main :: IO ()
main = do
    content <- BS.readFile "config.yml"
    let parsedContent = Y.decode content :: Maybe Cred
    case parsedContent of
        Nothing -> error "Could not parse config file."
        (Just (Cred u p)) -> putStrLn ("username: " ++ u ++ ", password: " ++ p)