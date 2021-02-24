import React from 'react';

const ArticlePhoto = ({ photo }) => {
  return (
    <figure>
      <img className="main-article-image" src={photo.photoUrl} alt={photo.altText} />
      <figcaption>
        &quot;
        <a href={photo.sourceUrl} target='_blank'>{photo.title}</a>
        &quot;&nbsp;
        (<a rel='license' href={photo.licenseUrl} target='_blank'>{photo.licenseType}</a>)
        &nbsp;by&nbsp;
        <a href={photo.photographerUrl} target='_blank'>{photo.photographerName}</a>
      </figcaption >
    </figure>    
  );
};

export default ArticlePhoto;