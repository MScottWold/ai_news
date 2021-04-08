export const selectArticles = ({ articles }, ids) => {
  return ids.map(id => articles[id]);
};

export const selectArticle = ({ articles }, id) => {
  const article = articles[id];
  return article || {};
}

export const selectAuthor = ({ authors }, authorId) => {
  return authors[authorId] || { articleIds: [] };
};