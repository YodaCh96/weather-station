# Weather Station

## Goals

* Import CSV files
* Table data type
* Basic operations of the Table data type
* Plot several data series in one plot
* Know the basic arithmetic rules of set theory
* Can transform terms with these calculation rules and simplify them under certain situations
* Can apply these rules to the Matlab data type Table

## Task

### Task 1.1

Import the data set **MET Office Weather Data.csv** into Matlab. Do the following:

* Save the file locally on your computer
* Open the file
* Create a script for reading the data set and save this script
* To do this you must use the **`Import Data`** button
* Study the script and change the name of the Matlab variable created by the import to **`weatherD`**.
* Which Matlab function is used to read in the data?

### Task 1.2

Execute the created script. This creates the variable **`weatherD`** with the type Table. Run the **`summary`** command. What information from Summary is not helpful?

### Task 1.3

Add to your script so that a new variable **`wDfixed`** is created that contains only valid values. How many rows were removed from the table?

### Task 1.4

Extend your script so that your table is sorted by year and month and create a plot that shows the maximum temperature over the years. Why is the result not useful?

### Task 1.5

Which weather station provides the most data? Create a new table that contains only the data from this weather station.

### Task 1.6

Create a new table containing the average temperatures per year. Use the **`groupsummary(..)`** function and plot the average maximum temperatures since the beginning of the measurement. Use the **`mean`** function for the calculation.

### Task 1.7

Run the same analysis again. This time, however, use the **`median`** function and plot the progression on the same graph. Choose an appropriate marker to distinguish the two data series. Compare the data and comment. Does the graph meet your expectations?

### Task 1.8

Which is the measuring station with the largest average rainfall per year, and which is the measuring station with the smallest average rainfall per year.

### Task 1.9

Draw a scatterplot that contrasts the rainfall and temperature of a station. Label the plot with title, X-axis and Y-axis.

### Task 1.10

Compare maximum temperatures of these two measuring stations in a boxplot.

## Task 2

### Task 2.1

Umformen von Termen:

1. A &cup; (A &cap; B)
2. A &cap; (A &cup; B)
3. B \ (B &cup; C)
4. B \ (B &cap; C)
5. A &cup; (B \ (C &cap; A))
6. A \ ((B &cup; C) &cap; (A &cup; C))

### Task 2.2

Wir verwenden für diese Übung denselben Datentype wie in Übung 1 (**`MET_Office_Weather_Data.csv`**). Wir betrachten aber nur die Daten des Jahres 2020.

Wir verwenden die Rechenregeln, um diejnigen Datensätze zu selektieren, die bezülgich **`tmin`** innerhalb der 25% Quartile liegen.

![Quartile](../images/quartile.PNG)

1. Erstellen von Teilmengen:
   1. Konstruieren Sie die Teilmenge der Daten des Jahres 2020 und halten Sie diese Menge in der Variable data2020 fest (entfernen Sie ungültige Werte)
   2. Bilden Sie die Teilmenge aboveMedian, welche alle Daten enthält, mit tmin > median(tmin). Bilden Sie die Teilmenge belowMedian, welche alle Daten enthält, mit tmin <= median(tmin)
   3. Wiederholen Sie dieses Verfahren für diese zwei Teilmengen und definieren sie jeweils zwei neue Namen für diese Teilmengen
2. Welche Wetterstationen haben ein tmin, welches zwischen unterem und oberem Quartil ist? – Das sind sollten 50% aller Datenätze sein. Prüfen Sie.
3. Schreiben Sie die Mengenoperationen, die Sie ausgeführt haben als Formel auf.
4. Welchem Bereich entspricht diese Menge in einem Boxplot?

## Task 3

* Lesen Sie die Daten der Datei "MET Office Weather Data .csv" in die Matlab Variable data ein.
* Bereiten Sie diese Variable so auf, dass Sie mit den Daten rain, sun, tmin, tmax rechnen können.
* Entfernen Sie die Spalte af aus den Daten.
* Bestimmen Sie die Wetterstation, welche die grösste Summe an Niederschlag pro Monat hat (über die gesamte Messzeit).
* Bestimmen Sie die Datenmenge, welche nur die Jahresdaten dieser, in Teilaufgabe 4. bestimmten Wetterstation beinhalten. Wenn Sie nicht wissen, wie Sie 4. lösen, wählen Sie eine beliebige Messstation.
* Erstellen Sie ein kombiniertes Diagramm, mit zwei Unterdiagrammen, welche untereinander stehen. Alle Diagramme beziehen sich auf die Datenmenge aus Aufgabe 5. Die Punkte für diese Aufgabe erhalte SIe, wenn 7. und  8. als Unterdiagramme gemacht werden.
* Das erste Unterdiagramm soll den Temperaturverlauf von Messbeginn bis Messende für die daten median_tmin und median_tmax darstellen.  Das Diagramm soll einen Titel, Achsenbeschriftungen sowie eine Legende haben.
* Das zweite Unterdiagramm soll die Sonnenscheindauer (mdian_sun) und die mittlere Regenmenge (median_rain) über die gesamte Messperiode darstellen. Achtung: die Sonnenscheindauer und die Regenmenge haben unterschiedliche Einheiten und dürfen nicht auf derselben y-Achse dargestellt werden! Das Diagramm soll einen Titel, Achsenbeschriftungen sowie eine Legende haben.

## Contributing

This is a personal learning project for me. Please feel free to fork this repo. Pull request to submit more programs.

## Feedback

If you find any bug or have any suggestion, please do file issues. I am graceful for any feedback and will do my best to improve this package.

## License

[MIT](LICENSE) © 2020 Ioannis Christodoulakis
