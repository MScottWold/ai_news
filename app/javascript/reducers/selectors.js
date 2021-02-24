export const selectArticles = ({ articles }, ids) => {
  return ids.map(id => articles[id]);
};

// export const selectSectionArticles = ({ articles }, )