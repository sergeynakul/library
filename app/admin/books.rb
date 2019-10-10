ActiveAdmin.register Book do
  permit_params :title, :picture, :group_id
end
