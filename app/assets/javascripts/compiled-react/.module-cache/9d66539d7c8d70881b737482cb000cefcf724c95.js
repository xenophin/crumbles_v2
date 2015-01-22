var MashupContainer = React.createClass({displayName: "MashupContainer",

  getInitialState: function() { 
    return { 
      phrase: [],
      audioNeeded: 0,
    } 
  },
 

  handlePhraseInput: function(words) {

    var newAudioNeeded = 0;
    var oldPhrase = this.state.phrase;
    var newPhrase = [];
    var samePhrase = true;

    for (var i=0; i < words.length; i++) {
      var word = words[i];
      if(oldPhrase[i] && word === oldPhrase[i]["word"]) {
        newPhrase.push(oldPhrase[i]);
      } 
      else {
        var entry = this.findInDictionary(StandardDict, word);
        if (!entry) {
          var undedfinedEntry = this.notInDictionary(StandardDict, word);
          // clone or it will binds all undefined to final word used
          entry = _.clone(undedfinedEntry); 
          newAudioNeeded += 1
        }

        newPhrase.push(entry);
        samePhrase = false;
      }
    };
    if(!samePhrase) {
      this.setState({ phrase: newPhrase, audioNeeded: newAudioNeeded });
    }
  },

  findInDictionary: function(dictionary, word) {
    var entry = dictionary["entries"][word]
    if (entry != undefined) {
      entry["defined"] = true;
      return entry;
    } else {
      return false;
    }
  },

  notInDictionary: function(dictionary, word) {
    var randomVideo = dictionary["entries"]["duck"];
    randomVideo["defined"] = false;
    randomVideo["word"] = word;
    return randomVideo;
  },

  render: function() {
    var entries = [];

    return (
      React.createElement("div", {idName: "mashup-container"}, 
        React.createElement(PhraseInput, {entries: this.state.phrase, onInput: this.handlePhraseInput}), 
        React.createElement(Player, {entries: this.state.phrase, audioNeeded: this.state.audioNeeded})
      )
    );
  }
});