import * as React from 'react';
import PropTypes from 'prop-types';
import Typography from '@material-ui/core/Typography';
import Grid from '@material-ui/core/Grid';
import Card from '@material-ui/core/Card';
import CardActionArea from '@material-ui/core/CardActionArea';
import CardContent from '@material-ui/core/CardContent';
import CardMedia from '@material-ui/core/CardMedia';
// import Images from './Images';

function Product(props) {
  const { product } = props;
  return (
    <Grid container spacing={3}>
      <Grid item xs={5}>
        {/* <Paper className={classes.paper}> */}
        <CardActionArea component='a' href='#'>
          <Card style={{ display: 'flex' }}>
            <CardContent style={{ flex: 1 }}>
              <Typography component='h2' variant='h5'>
                {product.title}
              </Typography>
              <Typography variant='subtitle1' color='text.secondary'>
                {product.date}
              </Typography>
              <Typography variant='subtitle1' paragraph>
                {product.description}
              </Typography>
              <Typography variant='subtitle1' color='primary'>
                Continue reading...
              </Typography>
            </CardContent>
            <CardMedia
              component='img'
              style={{ width: 160, display: { xs: 'none', sm: 'block' } }}
              image={product.image}
              alt={product.imageLabel}
            />
          </Card>
        </CardActionArea>
        {/* </Paper> */}
      </Grid>
      <Grid item xs={7}>
        {/* <Images /> */}
      </Grid>
    </Grid>
  );
}

Product.propTypes = {
  product: PropTypes.shape({
    date: PropTypes.string.isRequired,
    description: PropTypes.string.isRequired,
    image: PropTypes.string.isRequired,
    imageLabel: PropTypes.string.isRequired,
    title: PropTypes.string.isRequired,
  }).isRequired,
};

export default Product;
