function classes = make_inverted_index
        classes = containers.Map;	
	for i=1:1180
		try
		load(fullfile('./Histograms/',strcat('classes_map_vid',num2str(i),'.mat')));
		a = keys(classes_map);
		b = values(classes_map);
		i
		for j = 1 : size(a,2)
			insert_class(classes,a{j},i);	
		end
		catch
			
		end
	end
end
function classes_map = insert_class(classes_map,st,i)

  if  isKey(classes_map,st)
                get_video_index = classes_map(st) ;
		insert_index = size(get_video_index,2) + 1;
		get_video_index(insert_index) = i;
		classes_map(st) = get_video_index;
        else
                 classes_map(st) = [ i ] ;
        end

end
