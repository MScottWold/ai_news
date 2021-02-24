export const photoCaption = (photo) => {
  return (
    <figcaption>
      <a href={photo.sourceUrl} target='_blank'>{photo.title}</a> 
      &quot;&nbsp; 
      (<a rel='license' href={photo.licenseUrl} target='_blank'>{photo.licenseType}</a>) 
      &nbsp;by&nbsp; 
      <a href={photo.photographerUrl} target='_blank'>rjshade</a>
    </figcaption >
  );
};