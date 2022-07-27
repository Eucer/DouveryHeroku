var crypto = require('crypto');
const express = require("express");
const productRouter  = express.Router();
const auth = require("../middlewares/auth");
const { Product } = require("../modelos/product");

//*
productRouter.get("/api/products/", auth, async (req, res) => {
    try {
      const products = await Product.find({ category: req.query.category });
      res.json(products);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });


  //*
productRouter.get("/api/productsLimit/", auth, async (req, res) => {
  try {
    const products = await Product.find({ category: req.query.category }).limit(4);
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
  

  productRouter.get("/api/marca/products/", auth, async (req, res) => {
    try {
     
      const products = await Product.find({ marca: req.query.marca });
      res.json(products);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
  
  
  //*
productRouter.get("/api/products/new", auth, async (req, res) => {
  try {
    
    const products = await Product.find().sort({_id: -1});
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});



//*
productRouter.get("/api/products/search/:name", auth, async (req, res) => {
  try {
    const products = await Product.find({ name:{$regex: req.params.name, $options: 'si', $nin: [ 'acmebsmflkmXlahcorp' ] } });
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// create a post request route to rate the product.
productRouter.post("/api/rate-product", auth, async (req, res) => {
  try {
    const { id, rating } = req.body;
    let product = await Product.findById(id);

    for (let i = 0; i < product.ratings.length; i++) {
      if (product.ratings[i].userId == req.user) {
        product.ratings.splice(i, 1);
        break;
      }
    }

    const ratingSchema = {
      userId: req.user,
      rating,
    };

    product.ratings.push(ratingSchema);
    product = await product.save();
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});



// create a post request route to rate the product.
productRouter.post("/api/productviewd", auth, async (req, res) => {
  try {
    const { id, viewed } = req.body;
    let product = await Product.findById(id);

    for (let i = 0; i < product.viewed.length; i++) {
      if (product.viewed[i].userId == req.user) {
        product.viewed.splice(i, 1);
        break;
      }
    }

    const viewedSchema = {
      userId: req.user,
      viewed,
    };

    product.viewed.push(viewedSchema);
    product = await product.save();
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});



// c
productRouter.get("/api/deal-of-day", auth, async (req, res) => {
  try {
    let products = await Product.find({});

    products = products.sort((a, b) => {
      let aSum = 0;
      let bSum = 0;

      for (let i = 0; i < a.ratings.length; i++) {
        aSum += a.ratings[i].rating;
      }

      for (let i = 0; i < b.ratings.length; i++) {
        bSum += b.ratings[i].rating;
      }
      return aSum < bSum ? 1 : -1;
    });

    res.json(products[0]);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});



// c
productRouter.get("/api/list-product-deal", auth, async (req, res) => {
  try {
    let products = await Product.find({}).limit(10);

    products = products.sort((a, b) => {
      let aSum = -1;
      let bSum = -1;

      for (let i = 0; i < a.ratings.length; i++) {
        aSum += a.ratings[i].rating;
      }

      for (let i = 0; i < b.ratings.length; i++) {
        bSum += b.ratings[i].rating;
      }
      return aSum < bSum ? 1 : -1;
    },);

    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// c
productRouter.get("/api/list-radomn", auth, async (req, res) => {
  try {
    const products = await Product.find({price: {$lte: '100'}} );
   
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});



productRouter.get("/api/products/marca/brands", auth, async (req, res) => {
  try {
   
    const products = await Product.find({ category: req.query.category });
      
    products.id = nanoid() 
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});





// c
productRouter.get("/api/products/populate", auth, async (req, res) => {
  try {
  let products = await Product.find({
   
  },);

  

    products = products.sort((a, b) => {
      let aSum = 0;
      let bSum = 0;

      for (let i = 0; i < a.viewed.length; i++) {
        aSum += a.viewed[i].viewe;
      }

      for (let i = 0; i < b.viewed.length; i++) {
        bSum += b.viewed[i].viewe;
      }
      return aSum < bSum ? 1 : -1;
    },);

    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


//*
productRouter.get("/api/products/all", auth, async (req, res) => {
  try {
    
   
    const products = await Product.aggregate([{ $sample: { size: 20 } }]);
    
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = productRouter;