// import React from 'react';
import { connect } from 'react-redux';
import { getArticles } from '../../actions/article_actions';
import { selectArticles } from '../../reducers/selectors';
import { sectionNames } from '../../util/ui_util';

import Section from './section';

const mapStateToProps = (state, ownProps) => {
  const section = ownProps.match.params.sectionName;
  const articleIds = state.ui.filters[section] ? state.ui.filters[section] : [];
  const articles = selectArticles(state.entities, articleIds);

  return {
    sectionTitle: `Latest in ${sectionNames[section]}`,
    articleIds,
    articles
  };
};

const mapDispatchToProps = (dispatch, ownProps) => {
  const section = ownProps.match.params.sectionName;

  return {
    getInitialArticles: () => dispatch(getArticles({ filter: section })),
    getMoreArticles: (id) => dispatch(getArticles({ filter: section, after: id }))
  };
};

const SectionContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(Section);

export default SectionContainer;