import { connect } from 'react-redux';
import { getArticle } from '../../actions/article_actions';
import Article from './article';


const mapStateToProps = (state, ownProps) => {
  const id = ownProps.match.params.articleId;

  return {
    article: state.entities.articles[id]
  };
};

const mapDispatchToProps = (dispatch, ownProps) => ({
  getArticle: (id) => dispatch(getArticle(id))
});

const ArticleContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(Article);

export default ArticleContainer;