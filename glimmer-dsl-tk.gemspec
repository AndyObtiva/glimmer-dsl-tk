# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: glimmer-dsl-tk 0.0.49 ruby lib .

Gem::Specification.new do |s|
  s.name = "glimmer-dsl-tk".freeze
  s.version = "0.0.49"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze, ".".freeze]
  s.authors = ["AndyMaleh".freeze]
  s.date = "2021-12-05"
  s.description = "Glimmer DSL for Tk (MRI Ruby Desktop Development GUI Library) - Ruby DSL for Tcl/Tk with bidirectional/unidirectional data-binding support.".freeze
  s.email = "andy.am@gmail.com".freeze
  s.executables = ["girb".freeze]
  s.extra_rdoc_files = [
    "CHANGELOG.md",
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "CHANGELOG.md",
    "LICENSE.txt",
    "README.md",
    "VERSION",
    "bin/girb",
    "bin/girb_runner.rb",
    "glimmer-dsl-tk.gemspec",
    "icons/glimmer.png",
    "lib/glimmer-dsl-tk.rb",
    "lib/glimmer/data_binding/tk/list_selection_binding.rb",
    "lib/glimmer/data_binding/tk/one_time_observer.rb",
    "lib/glimmer/data_binding/tk/widget_binding.rb",
    "lib/glimmer/dsl/tk/attribute_expression.rb",
    "lib/glimmer/dsl/tk/bind_expression.rb",
    "lib/glimmer/dsl/tk/block_attribute_expression.rb",
    "lib/glimmer/dsl/tk/built_in_dialog_expression.rb",
    "lib/glimmer/dsl/tk/data_binding_expression.rb",
    "lib/glimmer/dsl/tk/dsl.rb",
    "lib/glimmer/dsl/tk/format_expression.rb",
    "lib/glimmer/dsl/tk/list_selection_data_binding_expression.rb",
    "lib/glimmer/dsl/tk/message_box_expression.rb",
    "lib/glimmer/dsl/tk/on_expression.rb",
    "lib/glimmer/dsl/tk/root_expression.rb",
    "lib/glimmer/dsl/tk/shine_data_binding_expression.rb",
    "lib/glimmer/dsl/tk/widget_expression.rb",
    "lib/glimmer/tk/checkbutton_proxy.rb",
    "lib/glimmer/tk/combobox_proxy.rb",
    "lib/glimmer/tk/drag_and_drop_event.rb",
    "lib/glimmer/tk/draggable_and_droppable.rb",
    "lib/glimmer/tk/entry_proxy.rb",
    "lib/glimmer/tk/frame_proxy.rb",
    "lib/glimmer/tk/label_proxy.rb",
    "lib/glimmer/tk/lbl_proxy.rb",
    "lib/glimmer/tk/list_proxy.rb",
    "lib/glimmer/tk/menu_item_proxy.rb",
    "lib/glimmer/tk/menu_proxy.rb",
    "lib/glimmer/tk/notebook_proxy.rb",
    "lib/glimmer/tk/os.rb",
    "lib/glimmer/tk/radiobutton_proxy.rb",
    "lib/glimmer/tk/root_proxy.rb",
    "lib/glimmer/tk/scrollbar_frame_proxy.rb",
    "lib/glimmer/tk/spinbox_proxy.rb",
    "lib/glimmer/tk/text_proxy.rb",
    "lib/glimmer/tk/text_variable_owner.rb",
    "lib/glimmer/tk/toplevel_proxy.rb",
    "lib/glimmer/tk/treeview_proxy.rb",
    "lib/glimmer/tk/variable_owner.rb",
    "lib/glimmer/tk/widget.rb",
    "lib/glimmer/tk/widget_proxy.rb",
    "samples/elaborate/meta_sample.rb",
    "samples/hello/hello_built_in_dialog.rb",
    "samples/hello/hello_button.rb",
    "samples/hello/hello_checkbutton.rb",
    "samples/hello/hello_combobox.rb",
    "samples/hello/hello_computed.rb",
    "samples/hello/hello_computed/contact.rb",
    "samples/hello/hello_contextual_menu.rb",
    "samples/hello/hello_drag_and_drop.rb",
    "samples/hello/hello_entry.rb",
    "samples/hello/hello_frame.rb",
    "samples/hello/hello_label.rb",
    "samples/hello/hello_list_multi_selection.rb",
    "samples/hello/hello_list_single_selection.rb",
    "samples/hello/hello_menu_bar.rb",
    "samples/hello/hello_message_box.rb",
    "samples/hello/hello_notebook.rb",
    "samples/hello/hello_radiobutton.rb",
    "samples/hello/hello_root.rb",
    "samples/hello/hello_scrollbar.rb",
    "samples/hello/hello_scrollbar_frame.rb",
    "samples/hello/hello_separator.rb",
    "samples/hello/hello_spinbox.rb",
    "samples/hello/hello_text.rb",
    "samples/hello/hello_toplevel.rb",
    "samples/hello/hello_world.rb",
    "samples/hello/images/align-center.png",
    "samples/hello/images/align-left.png",
    "samples/hello/images/align-right.png",
    "samples/hello/images/copy.png",
    "samples/hello/images/cut.png",
    "samples/hello/images/denmark.png",
    "samples/hello/images/finland.png",
    "samples/hello/images/france.png",
    "samples/hello/images/germany.png",
    "samples/hello/images/italy.png",
    "samples/hello/images/mexico.png",
    "samples/hello/images/netherlands.png",
    "samples/hello/images/norway.png",
    "samples/hello/images/paste.png",
    "samples/hello/images/picture.png",
    "samples/hello/images/redo.png",
    "samples/hello/images/search.png",
    "samples/hello/images/undo.png",
    "samples/hello/images/usa.png"
  ]
  s.homepage = "http://github.com/AndyObtiva/glimmer-dsl-tk".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.31".freeze
  s.summary = "Glimmer DSL for Tk".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<glimmer>.freeze, ["~> 2.5.1"])
    s.add_runtime_dependency(%q<puts_debuggerer>.freeze, ["~> 0.13.1"])
    s.add_runtime_dependency(%q<tk>.freeze, ["~> 0.4.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 1.0"])
    s.add_development_dependency(%q<jeweler>.freeze, [">= 2.3.9", "< 3.0.0"])
    s.add_development_dependency(%q<rake-tui>.freeze, [">= 0.2.1"])
    s.add_development_dependency(%q<coveralls>.freeze, ["= 0.8.23"])
    s.add_development_dependency(%q<json>.freeze, ["= 2.5.1"])
    s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.16.1"])
    s.add_development_dependency(%q<simplecov-lcov>.freeze, ["~> 0.7.0"])
  else
    s.add_dependency(%q<glimmer>.freeze, ["~> 2.5.1"])
    s.add_dependency(%q<puts_debuggerer>.freeze, ["~> 0.13.1"])
    s.add_dependency(%q<tk>.freeze, ["~> 0.4.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.5.0"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.0"])
    s.add_dependency(%q<jeweler>.freeze, [">= 2.3.9", "< 3.0.0"])
    s.add_dependency(%q<rake-tui>.freeze, [">= 0.2.1"])
    s.add_dependency(%q<coveralls>.freeze, ["= 0.8.23"])
    s.add_dependency(%q<json>.freeze, ["= 2.5.1"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.16.1"])
    s.add_dependency(%q<simplecov-lcov>.freeze, ["~> 0.7.0"])
  end
end

