local M = {}
local utils = require('svgo.utils')
local Config = require('svgo.config')
vim.notify = require('notify')

function M.setup(options)
  Config.setup(options)
end

function M.open_svg_under_cursor()
  local filetype = vim.bo.filetype
  local file_path = nil

  if filetype == 'tex' then
    file_path = utils.extract_path_from_tex_figure_environment()
  elseif filetype == 'markdown' then
    local line = vim.fn.getline('.')
    file_path = line:match('!%[[^%]]*%]%((.-)%s*%)')
  else
    vim.notify('[svgo.nvim] Not a tex or markdown document.', vim.log.levels.INFO)
    return
  end

  if file_path and file_path:sub(1, 1) ~= '/' and file_path:sub(1, 1) ~= '~' then
    local current_file_path = vim.fn.expand('%:p:h')
    file_path = current_file_path .. '/' .. file_path
  end
  if file_path then
    utils.open_file_in_vector_program(file_path)
  else
    vim.notify('[svgo.nvim] No figure environment found under cursor', vim.log.levels.INFO)
  end
end

function M.create_and_open_svg()
  local filename, abreviation =
    utils.create_document_name(vim.fn.input('[SVG] Filename (w/o extension): '))

  local output_file_absolute_path, output_is_relative = utils.get_output_path(filename)
  local template_file_absolute_path = utils.get_template_path()
  if not template_file_absolute_path then
    vim.notify('[svgo.nvim] No default SVG template found', vim.log.levels.ERROR)
    return
  end

  utils.copy_from_template(template_file_absolute_path, output_file_absolute_path)

  utils.open_file_in_vector_program(output_file_absolute_path)

  if output_is_relative then
    utils.insert_include_code(Config.options.illustration_dir .. '/' .. filename, abreviation)
  else
    utils.insert_include_code(output_file_absolute_path, abreviation)
  end
end

return M
