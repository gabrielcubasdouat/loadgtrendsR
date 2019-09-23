Load Google Trends data into R script dataframe and to PDI transformation respectively.

How to use it:

    - Insert search parameters manually into the job "load_gtrends.kjb";
    - Indicate the path for script within "Shell" Script step in the same job.
    - The results will generate two CSV files inside the current repository of the job;

OBS: Not indicated for production. Script and pdi files still in development.

Current problems:

	- Job and Transformation not connected by superior transformation or Job. Reason: job "load_gtrends.kjb" fails to be called correctly by the transformation;
	- Unnable to parametrize the location of the script within the "Shell" step because of internal PDI error

Backlog for future versions:

	- Create a transformation to call the job iteritavelly and store the values in a data flow;
	- Pass the result from the script in another way instead of a CSV file to prevent execution time and conversion problems;
	- Recieve parameters for the script directly from the Json files and/or other sources.