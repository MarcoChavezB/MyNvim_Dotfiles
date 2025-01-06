vim.api.nvim_create_user_command('Frun', function()
  -- Comprobar si ya existe una ventana terminal con 'flutter run' corriendo
  local found_terminal = false
  local terminal_win = nil
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)
    
    -- Comprobar si la ventana tiene un terminal y contiene 'flutter run' en el nombre del búfer
    if buf_name == '' then  -- 'buffer_name' vacío indica que es un terminal
      local output = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      for _, line in ipairs(output) do
        if string.match(line, "flutter run") then
          found_terminal = true
          terminal_win = win  -- Guardamos la ventana con 'flutter run'
          break
        end
      end
    end
    if found_terminal then break end
  end

  -- Si encontramos un terminal con 'flutter run', cerramos la ventana del terminal (split)
  if found_terminal then
    -- Cerrar la ventana del terminal que está corriendo 'flutter run'
    vim.api.nvim_win_close(terminal_win, true)
  end

  -- Crear una nueva ventana dividida hacia abajo
  vim.cmd('belowright split')

  -- Ajustar el tamaño de la ventana (opcional)
  vim.cmd('resize 5')

  -- Ejecutar flutter run en el terminal
  vim.cmd('terminal flutter run')
end, { desc = 'Ejecuta flutter run en el proyecto y muestra los logs en una ventana de terminal (reinicia la ejecución y cierra la sesión anterior)' })



vim.api.nvim_create_user_command('Frel', function()
  -- Comprobar si ya existe una ventana terminal con 'flutter run' corriendo
  local found_terminal = false
  local terminal_win = nil
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local buf_name = vim.api.nvim_buf_get_name(buf)
    
    -- Comprobar si la ventana tiene un terminal y contiene 'flutter run' en el nombre del búfer
    if buf_name == '' then  -- 'buffer_name' vacío indica que es un terminal
      local output = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      for _, line in ipairs(output) do
        if string.match(line, "flutter reload") then
          found_terminal = true
          terminal_win = win  -- Guardamos la ventana con 'flutter run'
          break
        end
      end
    end
    if found_terminal then break end
  end

  -- Si encontramos un terminal con 'flutter run', cerramos la ventana del terminal (split)
  if found_terminal then
    -- Cerrar la ventana del terminal que está corriendo 'flutter run'
    vim.api.nvim_win_close(terminal_win, true)
  end

  -- Crear una nueva ventana dividida hacia abajo
  vim.cmd('belowright split')

  -- Ajustar el tamaño de la ventana (opcional)
  vim.cmd('resize 5')

  -- Ejecutar flutter run en el terminal
  vim.cmd('terminal flutter run')
end, { desc = 'Ejecuta flutter run en el proyecto y muestra los logs en una ventana de terminal (reinicia la ejecución y cierra la sesión anterior)' })
