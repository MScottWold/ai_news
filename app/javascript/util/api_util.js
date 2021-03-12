export const getArticles = (filter) => {
  return $.ajax({
    method: 'GET',
    url: `api/articles?${$.param(filter)}`,
    dataType: 'json'
  });
}

export const getFrontPage = () => {
  return $.ajax({
    method: 'GET',
    url: 'api/articles/front_page',
    dataType: 'json'
  });
};

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

export const getAuthorArticles = (authorId, filter) => {
  return $.ajax({
    method: 'GET',
    url: `api/authors/${authorId}/articles?${$.param(filter)}`,
    dataType: 'json'
  })
};

export const postSession = user => {
  return $.ajax({
    method: 'POST',
    url: 'api/session',
    dataType: 'json',
    data: user
  });
};

export const deleteSession = () => {
  return $.ajax({
    method: 'DELETE',
    url: 'api/session',
    dataType: 'json'
  });
};

export const postUser = user => {
  return $.ajax({
    method: 'POST',
    url: 'api/users',
    dataType: 'json',
    data: user
  });
}

const changeFavoriteStatus = (articleId, favorite) => {
  return $.ajax({
    method: 'POST',
    url: `api/articles/${articleId}/${favorite}`,
    dataType: 'json'
  });
};

export const postFavorite = articleId => {
  return changeFavoriteStatus(articleId, 'favorite');
}

export const deleteFavorite = articleId => {
  return changeFavoriteStatus(articleId, 'unfavorite');
};

export const postComment = formComment => {
  return $.ajax({
    url: `api/articles/${formComment.articleId}/comments`,
    method: 'POST',
    dataType: 'json',
    data: { comment: formComment }
  });
};

export const getComments = (articleId, filter) => {
  return $.ajax({
    url: `api/articles/${articleId}/comments?${$.param(filter)}`,
    method: 'GET',
    dataType: 'json'
  });
};