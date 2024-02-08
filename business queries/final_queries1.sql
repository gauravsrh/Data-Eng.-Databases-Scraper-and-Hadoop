-- Query to highlight versatile anime producers with multiple-genre involvement, sorting by average popularity.

SELECT Producers.Producers, COUNT(DISTINCT Genres.gID) AS NumberOfGenres, AVG(descriptions.Popularity) AS AveragePopularity
FROM Producers
JOIN animeProducers ON Producers.pID = animeProducers.pID
JOIN descriptions ON animeProducers.malID = descriptions.malID
JOIN animeGenres ON descriptions.malID = animeGenres.malID
JOIN Genres ON animeGenres.gID = Genres.gID
GROUP BY Producers.Producers
HAVING NumberOfGenres > 1
ORDER BY AveragePopularity DESC;
