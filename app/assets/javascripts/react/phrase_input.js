var PhraseInput = React.createClass({

  handleText: function(text) {
    var words = this.makeWords(text);
    console.log(words);
    this.props.onInput(words);
  },

  makeWords: function(text) {
    console.log(text);
    var noPunctuation = text.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, " ");
    var spacedOut = noPunctuation.replace(/[^[a-zA-Z\s]/g, '');
    var lowercase = spacedOut.toLowerCase();
    var words = lowercase.split(" ");
    return _.compact(words);
  },

  render: function() {
    return (
      <TextBox onWordInput={this.handleText} entries={this.props.entries} />
    );
  }
});