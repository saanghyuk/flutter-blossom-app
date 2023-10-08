const express = require("express");
const router = express.Router();
const SearchController = require("../controller/searchController");

const _tokenCheck = (req, res, next) => {
  next();
};

/// search?q="query"
router.post("/", [_tokenCheck], SearchController.search);

module.exports = router;
