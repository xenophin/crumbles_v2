# Crumbles V2

A simple, React.js based front-end that communicates with a Cineaste server to concatenate videos.

This version of Crumbles does not currently require a database. Instead, JSON manifests are generated based off available videos in S3. 

## Dictionaries

This version of Crumbles has the initial dictionaries hard-coded. Currently, those dictionaries are: 
- Standard 
- Homer Simpson
- Bee and Puppycat

To add a new dictionary, you'll have to update the code in `tasks/import_words.rake` as well as `app/assets/javascripts/react/dictionary_list.js` and any relevant CSS needed to show new dictionary icons. 

The `app/assets/javascripts/dictionaries/` folder does *not* need to be updated, as the json files within are generated by the `import_words` rake task. 


## Setup

1. `bundle install`

2. Generate dictionaries using `rake import:dictionaries`
    - Dictionaries are generated based off available videos in S3. 
    - They are stored as JSON mainfests in `/app/assets/javascripts/dictionaries`
    - They are retreived in `/app/assets/javascripts/react/mashup_container.js`
    - See the rake task in `tasks/import_dictionaries.rake` for more info

3. Set `cineaste_url` in `/app/assets/javascripts/react/mashup_container.js` to the URL or IP of your Cineaste instance. (As of February 23, 2015 this is set to legacy 'http://upverse.com' )

4. `foreman start`


## Before Production

- Precompile JSX
- Enable Caching
- Hook in any appropriate analytics and social

