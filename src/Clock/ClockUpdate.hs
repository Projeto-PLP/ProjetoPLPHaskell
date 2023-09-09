module Clock.ClockUpdate where

import Utils.MatrixUtils (writeMatrixValue)

-- Atualiza no arquivo .txt o relógio
updateMatrixClock :: FilePath -> Int -> IO ()
updateMatrixClock filePath num = do
    let val = formatHour num
    writeMatrixValue filePath val 3 88


-- Recebe os minutos e formata para horas em uma String (500 minutos -> 08:20)
formatHour :: Int -> String
formatHour num
    | num `div` 60 < 10 && num `mod` 60 < 10 = "0" ++ show (num `div` 60) ++ ":0" ++ show (num `mod` 60)
    | num `div` 60 < 10 && num `mod` 60 >= 10 = "0" ++ show (num `div` 60) ++ ":" ++ show (num `mod` 60)
    | num `div` 60 >= 10 && num `mod` 60 < 10 = show (num `div` 60) ++ ":0" ++ show (num `mod` 60)
    | otherwise = show (num `div` 60) ++ ":" ++ show (num `mod` 60)
    