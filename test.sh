
#STANFORD Libraries folder
export STANFORD_HOME=Stanford/

mono ATPR/ATPR.exe -c entities -i Texts/ -o entities.xml 

entitiesTest=$(diff entities.xml entitiesPass.xml  | wc -l)


if [ "$entitiesTest" -eq "0" ]; then
	echo -e "\e[32mEntities Test Passed\e[0m"
else
	echo -e "\e[31mEntities Test Failed\e[0m"
	echo $entitiesTest
fi

mono ATPR/ATPR.exe -c dictionary -i Texts/ -o dic.csv 

dictionary=$(diff dic.csv dicPass.csv  | wc -l)


if [ "$dictionary" -eq "0" ]; then
	echo -e "\e[32mDictionary Test Passed\e[0m"
else
	echo -e "\e[31mDictionary Test Failed\e[0m"
	echo $dictionary
fi

mono ATPR/ATPR.exe -c match -i Texts/ -d dic.csv -o matchResults.csv 

match=$(diff matchResults.csv matchResultsPass.csv  | wc -l)


if [ "$match" -eq "0" ]; then
	echo -e "\e[32mMatch Test Passed\e[0m"
else
	echo -e "\e[31mMatch Test Failed\e[0m"
	echo $match
fi



