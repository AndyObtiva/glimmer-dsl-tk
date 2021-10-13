# Copyright (c) 2020-2021 Andy Maleh
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'glimmer-dsl-tk'

class HelloCheckbutton
  class Person
    attr_accessor :skiing, :snowboarding, :snowmobiling, :snowshoeing, :winter_activities, :winter_activities_alternate
    
    def initialize
      reset_activities!
      individual_observer = Glimmer::DataBinding::Observer.proc do
        unless @updating_group
          @updating_individual = true
          if skiing && snowboarding && snowmobiling && snowshoeing
            self.winter_activities = true
            self.winter_activities_alternate = false
          elsif skiing || snowboarding || snowmobiling || snowshoeing
            self.winter_activities = true
            self.winter_activities_alternate = true
          else
            self.winter_activities = false
            self.winter_activities_alternate = false
          end
          @updating_individual = false
        end
      end
      individual_observer.observe(self, :skiing)
      individual_observer.observe(self, :snowboarding)
      individual_observer.observe(self, :snowmobiling)
      individual_observer.observe(self, :snowshoeing)
      
      group_observer = Glimmer::DataBinding::Observer.proc do
        unless @updating_individual
          @updating_group = true
          self.skiing = self.winter_activities
          self.snowboarding = self.winter_activities
          self.snowmobiling = self.winter_activities
          self.snowshoeing = self.winter_activities
          @updating_group = false
        end
      end
      group_observer.observe(self, :winter_activities)
    end
    
    def reset_activities!
      self.winter_activities = true
      self.winter_activities_alternate = true
      self.skiing = false
      self.snowboarding = true
      self.snowmobiling = false
      self.snowshoeing = false
    end
  end
  
  include Glimmer
  
  def initialize
    @person = Person.new
  end
  
  def launch
    root {
      title 'Hello, Checkbutton!'
      background '#ececec' if OS.mac?
      
      label {
        text 'Check all snow activities you are interested in:'
        font 'caption'
      }
      
      frame {
        checkbutton {
          text 'Winter Activities'
          variable <=> [@person, :winter_activities]
          alternate <=> [@person, :winter_activities_alternate] # binds half-checked state
        }
        
        frame {
          checkbutton {
            text 'Skiing'
            variable <=> [@person, :skiing]
          }
          
          checkbutton {
            text 'Snowboarding'
            variable <=> [@person, :snowboarding]
          }
          
          checkbutton {
            text 'Snowmobiling'
            variable <=> [@person, :snowmobiling]
          }
          
          checkbutton {
            text 'Snowshoeing'
            variable <=> [@person, :snowshoeing]
          }
        }
      }
      
      button {
        text 'Reset Activities'
        
        command do
          @person.reset_activities!
        end
      }
    }.open
  end
end

HelloCheckbutton.new.launch
