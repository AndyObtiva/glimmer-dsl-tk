require 'glimmer-dsl-tk'

class HelloEntry
  include Glimmer
  
  attr_accessor :default, :center, :left, :right, :password, :telephone, :read_only, :wrap, :multi
  
  def initialize
    self.default = 'default'
    self.center = 'centered'
    self.left = 'left-aligned'
    self.right = 'right-aligned'
    self.password = 'password'
    self.telephone = '555-555-5555'
    self.read_only = 'Telephone area code is 555'
    self.wrap = 'wraps if text content is too long like this example'
    self.multi = "multi-line enables hitting enter,\nbut does not wrap by default"
  end
  
  def launch
    root { |r|
      title 'Hello, Entry!'
      
      label { |l|
        grid sticky: 'ew', column_weight: 1
        text 'text'
      }
      entry { |l|
        grid sticky: 'ew'
        text <=> [self, :default]
      }
      
#       label {
#         text 'text(:center, :border)'
#       }
#       text(:center, :border) {
#         layout_data :fill, :center, true, false
#         text <=> [self, :center]
#       }
#
#       label {
#         text 'text(:left, :border)'
#       }
#       text(:left, :border) {
#         layout_data :fill, :center, true, false
#         text <=> [self, :left]
#       }
#
#       label {
#         text 'text(:right, :border)'
#       }
#       text(:right, :border) {
#         layout_data :fill, :center, true, false
#         text <=> [self, :right]
#       }
#
#       label {
#         text 'text(:password, :border)'
#       }
#       text(:password, :border) {
#         layout_data :fill, :center, true, false
#         text <=> [self, :password]
#       }
#
#       label {
#         text 'text(:read_only, :border)'
#       }
#       text(:read_only, :border) {
#         layout_data :fill, :center, true, false
#         text <=> [self, :read_only]
#       }
#
#       label {
#         text 'text with event handlers'
#       }
#       text {
#         layout_data :fill, :center, true, false
#         text <=> [self, :telephone]
#
        ### this event kicks in just after the user typed and before modifying the text attribute value
#         on_verify_text do |verify_event|
#           new_text = verify_event.widget.text.clone
#           new_text[verify_event.start...verify_event.end] = verify_event.text
#           verify_event.doit = telephone?(new_text)
#         end
#
        ### this event kicks in just after the text widget is verified and modified
#         on_modify_text do |modify_event|
#           self.read_only = "Telephone area code is #{modify_event.widget.text.gsub(/[^0-9]/, '')[0...3]}"
#         end
#       }
#
#       label {
#         text 'text(:wrap, :border)'
#       }
#       text(:wrap, :border) {
#         layout_data(:fill, :center, true, false) {
#           width_hint 100
#         }
#         text <=> [self, :wrap]
#       }
#
#       label {
#         text 'text(:multi, :border)'
#       }
#       text(:multi, :border) {
#         layout_data :fill, :center, true, false
#         text <=> [self, :multi]
#       }
    }.open
  end
  
  def telephone?(text)
    !!text.match(/^\d{0,3}[-.\/]?\d{0,3}[-.\/]?\d{0,4}$/)
  end
end

HelloEntry.new.launch
