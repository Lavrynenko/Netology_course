# Sample python code for playlistItems.list

def playlist_items_list_by_playlist_id(service, **kwargs):
  kwargs = remove_empty_kwargs(**kwargs) # See full sample for function
  results = service.playlistItems().list(
    **kwargs
  ).execute()

  print_results(results)

playlist_items_list_by_playlist_id(service,
    part='snippet,contentDetails',
    maxResults=25,
    playlistId='PLBCF2DAC6FFB574DE')