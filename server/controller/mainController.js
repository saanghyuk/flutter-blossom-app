const dummy = {};

class mainController {
  home = (req, res) => {
    res.json(dummy);
  };
}

module.exports = new mainController();
