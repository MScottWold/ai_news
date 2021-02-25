export const selectArticles = ({ articles }, ids) => {
  return ids.map(id => articles[id]);
};

export const selectAuthor = ({ authors }, authorId) => {
  return authors[authorId] || { articleIds: [] };
};
// export const selectSectionArticles = ({ articles }, )