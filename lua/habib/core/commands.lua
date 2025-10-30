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

  if found_terminal then
    vim.api.nvim_win_close(terminal_win, true)
  end

  vim.cmd('belowright split')

  vim.cmd('resize 5')

  vim.cmd('terminal flutter run')
end, { desc = 'Ejecuta flutter run en el proyecto y muestra los logs en una ventana de terminal (reinicia la ejecución y cierra la sesión anterior)' })


vim.api.nvim_create_user_command("FocDev", function()
  if _G.ComposerWin and vim.api.nvim_win_is_valid(_G.ComposerWin) then
    vim.api.nvim_set_current_win(_G.ComposerWin)
  else
    print("La ventana de Composer no está abierta")
  end
end, { desc = "Dar foco a la ventana flotante de Composer" })

vim.api.nvim_create_user_command("ComposerDev", function()
  local width = 30
  local height = 5
  local row = vim.o.lines - height - 2
  local col = vim.o.columns - width - 2

  local buf = vim.api.nvim_create_buf(false, true)

  local opts = {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "single",
  }

  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Ejecutar composer en el terminal
  vim.fn.termopen("composer run dev")

  vim.api.nvim_buf_set_name(buf, "ComposerDevPopupRight")

  -- Guardar el ID de la ventana **aquí**, donde `win` existe
  _G.ComposerWin = win
end, { desc = "Ejecuta composer run dev en popup flotante abajo a la derecha" })


vim.api.nvim_create_user_command("ApiServer", function()
  local width = 30
  local height = 5
  local row = vim.o.lines - height - 2
  local col = vim.o.columns - width - 2

  local buf = vim.api.nvim_create_buf(false, true)

  local opts = {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "single",
  }

  local win = vim.api.nvim_open_win(buf, true, opts)

  -- Ejecutar composer en el terminal
  vim.fn.termopen("php artisan serve --host=192.168.1.19")

  vim.api.nvim_buf_set_name(buf, "ComposerDevPopupRight")

  -- Guardar el ID de la ventana **aquí**, donde `win` existe
  _G.ComposerWin = win
end, { desc = "Ejecuta composer run dev en popup flotante abajo a la derecha" })

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
