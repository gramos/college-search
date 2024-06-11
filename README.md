# College Search
​
## Note: you'll need to get an API key (simple to do) from the services provided below:

Using the College Scorecard API provided by the department of education, please create a page that includes:

1. A search box for college names  
2. Use Google Maps to display the location of each college returned
​
### Reference

https://collegescorecard.ed.gov/data/documentation/

https://github.com/RTICWDT/open-data-maker/blob/master/API.md

## Installation

```
git clone git@github.com:gramos/college-search.git
cd college-search
bundle install
```

You will need 2 api_key, your google api key
and the collegescorecard api key, you have to
set 2 env vars to do that:

```
export GMAPS_API_KEY=your-key-here
export COLLEGE_API_KEY=your-key-here
```

