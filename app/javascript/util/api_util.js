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

// export const postFavorite = articleId => {
//   return $.ajax({
//     method: 'POST',
//     url: `api/articles/${articleId}/favorites`,
//     dataType: 'json'
//   });
// };

// export const deleteFavorite = articleId => {
//   return $.ajax({
//     method: 'DELETE',
//     url: `api/articles/${articleId}/favorites`,
//     dataType: 'json'
//   });
// };

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