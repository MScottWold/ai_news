export const getArticles = (filter) => {
  return $.ajax({
    method: 'GET',
    url: `api/articles?${$.param(filter)}`,
    dataType: 'json'
  });
}

export const getSingleArticle = id => {
  return $.ajax({
    method: 'GET',
    url: `api/articles/${id}`,
    dataType: 'json'
  });
};

export const getAuthor = id => {
  return $.ajax({
    method: 'GET',
    url: `api/authors/${id}`,
    dataType: 'json'
  });
};