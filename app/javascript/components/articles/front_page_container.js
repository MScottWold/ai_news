import { connect } from 'react-redux';
import { getFrontPage } from '../../actions/front_page_actions';
import FrontPage from './front_page';

const mapStateToProps = state => ({
  featuredArticle: state.entities.frontPage.featured,
  highlightedArticles: state.entities.frontPage.highlighted
});

const mapDispatchToProps = dispatch => ({
  getFrontPage: () => dispatch(getFrontPage())
});

const FrontPageContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(FrontPage);

export default FrontPageContainer;