var PhraseInput = React.createClass({

  handleText: function(text) {
    var words = this.makeWords(text);
    console.log(words);
    this.props.onInput(words);
  },

  makeWords: function(text) {
    console.log(text);
    var noPunctuation = text.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, " ");
    var spacedOut = noPunctuation.replace(/[^[a-zA-Z0-9\s]/g, '');
    var lowercase = spacedOut.toLowerCase();
    var words = lowercase.split(" ");
    var compacted = _.compact(words);
    if(compacted.length > 25) {
      compacted = compacted.slice(0,25);
    }
    return compacted;
  },

  render: function() {
    return (
      <div id="input-container">
        <TextBox ref="textbox" onWordInput={this.handleText} entries={this.props.entries} />
      </div>
    );
  }
});
