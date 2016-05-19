{-# LANGUAGE OverloadedStrings #-}

module Redmine.Lib
    ( someFunc
    ) where
import Data.ByteString (ByteString)
import Data.ByteString.Char8 (pack, append)
import Redmine.Get
import Redmine.Rest (ParamRest)
import Data.Map (fromList)


someFunc :: IO ()
someFunc = putStrLn "someFunc"
type Url = ByteString
searchProj :: [(ByteString, ByteString)] -> ParamRest
searchProj x = fromList $ [("project_id", bshow $ sample_project_id config)] ++ x

searchSub x = searchProj [("subject", x )]
bshow = pack . show
searchPr :: Int -> ParamRest
searchPr x = searchProj [("cf_" `append` (bshow $ prname_id config), bshow x)]
data VDBPMConfig = VDBPMConfig {
              url :: Url
            , sequence_request_project_id :: Int
            , sample_project_id ::  Int
            , new_sample_tracker_id :: Int
            , new_sequence_request_tracker_id :: Int
            , new_sample_status_id :: Int
            , new_sequence_request_status_id :: Int
            , samplelist_id :: Int
            , platform_id :: Int
            , samplessynced_id :: Int
            , prname_id ::  Int
            , sysadmin_group_id ::  Int
            }

config = VDBPMConfig {url = "https://vdbpm.org",
sequence_request_project_id = 1,
sample_project_id = 18,
new_sample_tracker_id = 6,
new_sequence_request_tracker_id = 4,
new_sample_status_id = 1,
new_sequence_request_status_id = 1,
samplelist_id = 4,
platform_id = 5,
samplessynced_id = 6,
prname_id = 19,
sysadmin_group_id = 33
}
