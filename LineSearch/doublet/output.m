function output(channel_name, freqs, coh, doublet_freqs, path)
	% plot the data and save the plot
	% channels_name: name for title of plot
	% freqs: frequencies of the data
	% coh: coherence of the data, corresponding to freqs
	% doublet_freqs: the frequencies of the doublets to mark in the plot
	% path: where the plot is saved, down to /channel.jpg

	% init the figure
	figure1 = figure;
        set(figure1, 'Visible', 'off');
        axes1 = axes('Parent', figure1);
        hold(axes1, 'all');

	% plot the data
        plot(freqs, coh);
        
	% plot the coordinates
	t = title(channel_name);
        set(t, 'interpreter', 'none');
        xlabel('Frequency (Hz)');
        ylabel('Coherence');
        xlim([freqs(1),freqs(end)]);
        grid on;
        
	% plot the line
	yl = max(coh);
        line([doublet_freqs(1), doublet_freqs(1)],[0, yl], 'LineStyle', '-.', 'Color',[1 0 0], 'LineWidth', 0.1);
	line([doublet_freqs(2), doublet_freqs(2)],[0, yl], 'LineStyle', '-.', 'Color',[1 0 0], 'LineWidth', 0.1);
        saveas(figure1, path);
end
