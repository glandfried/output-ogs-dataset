summary/summary.csv: resultsJson
	make -C summary/

resultsJson: resultsJson.zip
	unzip -u resultsJson.zip # -d data/

resultsJson.zip:
	wget https://github.com/glandfried/output-ogs-dataset/releases/download/v1.1/resultsJson.zip #-O data/results.zip

pickleToJson: results
	python3 pickleToJson.py

results: results.zip
	unzip -u resultsJson.zip

results.zip:
	wget https://github.com/glandfried/output-ogs-dataset/releases/download/v1.1/results.zip
