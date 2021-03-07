import { RECEIVE_AUTHOR } from '../actions/author_actions';
import { RECEIVE_AUTHOR_ARTICLES } from '../actions/article_actions';

const authorsReducer = (state = {}, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_AUTHOR:
      return Object.assign({}, state, action.author);
    case RECEIVE_AUTHOR_ARTICLES: {
      const { authorId } = action;
      const newArticleIds = [
        ...state[authorId].articleIds, 
        ...action.articleIds
      ]
      const author = Object.assign(
        {}, 
        state[action.authorId],
        { articleIds: newArticleIds}
      )
      return Object.assign({}, state, { [authorId]: author})
    }
    default:
      return state;
  }
};

export default authorsReducer;