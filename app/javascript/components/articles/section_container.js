// import React from 'react';
import { connect } from 'react-redux';
import Section from './section';
import { getArticles } from '../../actions/article_actions';
import { selectArticles } from '../../reducers/selectors';

const mapStateToProps = (state, ownProps) => {
  const section = ownProps.match.params.sectionName;
  let articleIds = state.ui.filters[`${section}ArticleIds`]
  if (!articleIds) {
    articleIds = [];
  }

  return {
    articles: selectArticles(state.entities, articleIds),
    section: section
  };
};

const mapDispatchToProps = (dispatch, ownProps) => {
  const section = ownProps.match.params.sectionName;

  return {
    getSectionArticles: () => dispatch(getArticles({ filter: 'section', name: section }))
  };
};

const SectionContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(Section);

export default SectionContainer;