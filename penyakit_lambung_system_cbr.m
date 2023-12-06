function asam_lambung_system_cbr
    % Membuat figure
    main_figure = figure('Name', 'Sistem Pakar Identifikasi Penyakit Lambung (CBR)', 'Position', [100, 100, 600, 400]);

    % Membuat panel untuk input gejala
    input_panel = uipanel(main_figure, 'Title', 'Masukkan Gejala', 'Position', [0.05, 0.6, 0.4, 0.35]);

    % Membuat label dan dropdown untuk gejala 1
    uicontrol(input_panel, 'Style', 'text', 'Position', [20, 70, 100, 20], 'String', 'Gejala 1:');
    gejala1_dropdown = uicontrol(input_panel, 'Style', 'popupmenu', 'Position', [130, 70, 100, 30], 'String', {'Rasa Melilit Pada ulu Ati', 'Ringan', 'Sedang', 'Berat'});

    % Membuat label dan dropdown untuk gejala 2
    uicontrol(input_panel, 'Style', 'text', 'Position', [20, 40, 100, 20], 'String', 'Gejala 2:');
    gejala2_dropdown = uicontrol(input_panel, 'Style', 'popupmenu', 'Position', [130, 40, 100, 30], 'String', {'Demam Tinggi', 'Ringan', 'Sedang', 'Berat'});

    % Membuat tombol untuk mengidentifikasi
    identifikasi_button = uicontrol(main_figure, 'Style', 'pushbutton', 'String', 'Identifikasi', 'Position', [250, 100, 100, 30], 'Callback', @identifikasi_callback);

    % Membuat panel untuk menampilkan hasil identifikasi
    output_panel = uipanel(main_figure, 'Title', 'Hasil Identifikasi', 'Position', [0.55, 0.6, 0.4, 0.35]);
    hasil_identifikasi_text = uicontrol(output_panel, 'Style', 'text', 'Position', [20, 40, 350, 30], 'String', '', 'HorizontalAlignment', 'left');

    % Fungsi callback untuk tombol identifikasi
    function identifikasi_callback(~, ~)
        % Dapatkan nilai gejala dari dropdown
        gejala1_value = get(gejala1_dropdown, 'Value');
        gejala2_value = get(gejala2_dropdown, 'Value');

        % Identifikasi penyakit asam lambung berdasarkan CBR
        diagnosis = identifikasi_penyakit_asam_lambung_cbr(gejala1_value, gejala2_value);

        % Tampilkan hasil diagnosa
        set(hasil_identifikasi_text, 'String', ['Hasil Identifikasi: ', diagnosis]);
    end

    % Fungsi untuk identifikasi penyakit asam lambung berdasarkan CBR
    function diagnosis = identifikasi_penyakit_asam_lambung_cbr(gejala1, gejala2)
        % Implementasikan logika CBR di sini berdasarkan basis kasus dan aturan CBR Anda
        % Contoh logika sederhana:
        if gejala1 == 1 && gejala2 == 1
            diagnosis = 'Anda Mengalami Sakit Asam Lambung';
        elseif gejala1 == 4 || gejala2 == 4
            diagnosis = 'Anda Mungkin Mengalami Asam Lambung Berat';
        else
            diagnosis = 'Anda Mungkin Mengalami Asam Lambung Ringan atau Sedang';
        end
    end
end
