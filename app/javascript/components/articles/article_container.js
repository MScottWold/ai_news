import { connect } from 'react-redux';
import { 
  getArticle, 
  favoriteArticle,
  unfavoriteArticle
} from '../../actions/article_actions';
import { selectArticle } from '../../reducers/selectors';
import Article from './article';


const mapStateToProps = (state, ownProps) => {
  const id = ownProps.match.params.articleId;
  const article = selectArticle(state.entities, id);
  const favorited = article.favorited;
  
  return {
    article, 
    favorited,
    loggedIn: Boolean(state.ui.currentUser)
  };
};

const mapDispatchToProps = (dispatch, ownProps) => {
  const id = ownProps.match.params.articleId
  
  return {
    getArticle: () => dispatch(getArticle(id)),
    favoriteArticle: () => dispatch(favoriteArticle(id)),
    unfavoriteArticle: () => dispatch(unfavoriteArticle(id))
  };
};

const ArticleContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(Article);

export default ArticleContainer;