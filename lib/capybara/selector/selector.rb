# frozen_string_literal: true

# rubocop:disable Style/AsciiComments

module Capybara
  #
  # ## Built-in Selectors
  #
  #   * **:xpath** - Select elements by XPath expression
  #     * Locator: An XPath expression
  #
  #   * **:css** - Select elements by CSS selector
  #     * Locator: A CSS selector
  #
  #   * **:id** - Select element by id
  #     * Locator: (String, Regexp, XPath::Expression) The id of the element to match
  #
  #   * **:field** - Select field elements (input [not of type submit, image, or hidden], textarea, select)
  #     * Locator: Matches against the id, Capybara.test_id attribute, name, or placeholder
  #     * Filters:
  #       * :id (String, Regexp, XPath::Expression) — Matches the id attribute
  #       * :name (String) — Matches the name attribute
  #       * :placeholder (String) — Matches the placeholder attribute
  #       * :type (String) — Matches the type attribute of the field or element type for 'textarea' and 'select'
  #       * :readonly (Boolean)
  #       * :with (String) — Matches the current value of the field
  #       * :class (String, Array<String>, Regexp, XPath::Expression) — Matches the class(es) provided
  #       * :checked (Boolean) — Match checked fields?
  #       * :unchecked (Boolean) — Match unchecked fields?
  #       * :disabled (Boolean) — Match disabled field?
  #       * :multiple (Boolean) — Match fields that accept multiple values
  #       * :style (String, Regexp, Hash)
  #
  #   * **:fieldset** - Select fieldset elements
  #     * Locator: Matches id or contents of wrapped legend
  #     * Filters:
  #       * :id (String, Regexp, XPath::Expression) — Matches id attribute
  #       * :legend (String) — Matches contents of wrapped legend
  #       * :class (String, Array<String>, Regexp, XPath::Expression) — Matches the class(es) provided
  #       * :style (String, Regexp, Hash)
  #
  #   * **:link** - Find links ( <a> elements with an href attribute )
  #     * Locator: Matches the id or title attributes, or the string content of the link, or the alt attribute of a contained img element
  #     * Filters:
  #       * :id (String, Regexp, XPath::Expression) — Matches the id attribute
  #       * :title (String) — Matches the title attribute
  #       * :alt (String) — Matches the alt attribute of a contained img element
  #       * :class (String, Array<String>, Regexp, XPath::Expression) — Matches the class(es) provided
  #       * :href (String, Regexp, nil) — Matches the normalized href of the link, if nil will find <a> elements with no href attribute
  #       * :style (String, Regexp, Hash)
  #
  #   * **:button** - Find buttons ( input [of type submit, reset, image, button] or button elements )
  #     * Locator: Matches the id, Capybara.test_id attribute, value, or title attributes, string content of a button, or the alt attribute of an image type button or of a descendant image of a button
  #     * Filters:
  #       * :id (String, Regexp, XPath::Expression) — Matches the id attribute
  #       * :title (String) — Matches the title attribute
  #       * :class (String, Array<String>, Regexp, XPath::Expression) — Matches the class(es) provided
  #       * :value (String) — Matches the value of an input button
  #       * :type
  #       * :style (String, Regexp, Hash)
  #
  #   * **:link_or_button** - Find links or buttons
  #     * Locator: See :link and :button selectors
  #
  #   * **:fillable_field** - Find text fillable fields ( textarea, input [not of type submit, image, radio, checkbox, hidden, file] )
  #     * Locator: Matches against the id, Capybara.test_id attribute, name, or placeholder
  #     * Filters:
  #       * :id (String, Regexp, XPath::Expression) — Matches the id attribute
  #       * :name (String) — Matches the name attribute
  #       * :placeholder (String) — Matches the placeholder attribute
  #       * :with (String) — Matches the current value of the field
  #       * :type (String) — Matches the type attribute of the field or element type for 'textarea'
  #       * :class (String, Array<String>, Regexp, XPath::Expression) — Matches the class(es) provided
  #       * :disabled (Boolean) — Match disabled field?
  #       * :multiple (Boolean) — Match fields that accept multiple values
  #       * :style (String, Regexp, Hash)
  #
  #   * **:radio_button** - Find radio buttons
  #     * Locator: Match id, Capybara.test_id attribute, name, or associated label text
  #     * Filters:
  #       * :id (String, Regexp, XPath::Expression) — Matches the id attribute
  #       * :name (String) — Matches the name attribute
  #       * :class (String, Array<String>, Regexp, XPath::Expression) — Matches the class(es) provided
  #       * :checked (Boolean) — Match checked fields?
  #       * :unchecked (Boolean) — Match unchecked fields?
  #       * :disabled (Boolean) — Match disabled field?
  #       * :option (String) — Match the value
  #       * :style (String, Regexp, Hash)
  #
  #   * **:checkbox** - Find checkboxes
  #     * Locator: Match id, Capybara.test_id attribute, name, or associated label text
  #     * Filters:
  #       * *:id (String, Regexp, XPath::Expression) — Matches the id attribute
  #       * *:name (String) — Matches the name attribute
  #       * *:class (String, Array<String>, Regexp, XPath::Expression) — Matches the class(es) provided
  #       * *:checked (Boolean) — Match checked fields?
  #       * *:unchecked (Boolean) — Match unchecked fields?
  #       * *:disabled (Boolean) — Match disabled field?
  #       * *:option (String) — Match the value
  #       * :style (String, Regexp, Hash)
  #
  #   * **:select** - Find select elements
  #     * Locator: Match id, Capybara.test_id attribute, name, placeholder, or associated label text
  #     * Filters:
  #       * :id (String, Regexp, XPath::Expression) — Matches the id attribute
  #       * :name (String) — Matches the name attribute
  #       * :placeholder (String) — Matches the placeholder attribute
  #       * :class (String, Array<String>, Regexp, XPath::Expression) — Matches the class(es) provided
  #       * :disabled (Boolean) — Match disabled field?
  #       * :multiple (Boolean) — Match fields that accept multiple values
  #       * :options (Array<String>) — Exact match options
  #       * :with_options (Array<String>) — Partial match options
  #       * :selected (String, Array<String>) — Match the selection(s)
  #       * :with_selected (String, Array<String>) — Partial match the selection(s)
  #       * :style (String, Regexp, Hash)
  #
  #   * **:option** - Find option elements
  #     * Locator: Match text of option
  #     * Filters:
  #       * :disabled (Boolean) — Match disabled option
  #       * :selected (Boolean) — Match selected option
  #
  #   * **:datalist_input**
  #     * Locator:
  #     * Filters:
  #       * :disabled
  #       * :name
  #       * :placeholder
  #
  #   * **:datalist_option**
  #     * Locator:
  #
  #   * **:file_field** - Find file input elements
  #     * Locator: Match id, Capybara.test_id attribute, name, or associated label text
  #     * Filters:
  #       * :id (String, Regexp, XPath::Expression) — Matches the id attribute
  #       * :name (String) — Matches the name attribute
  #       * :class (String, Array<String>, Regexp, XPath::Expression) — Matches the class(es) provided
  #       * :disabled (Boolean) — Match disabled field?
  #       * :multiple (Boolean) — Match field that accepts multiple values
  #       * :style (String, Regexp, Hash)
  #
  #   * **:label** - Find label elements
  #     * Locator: Match id or text contents
  #     * Filters:
  #       * :for (Element, String) — The element or id of the element associated with the label
  #
  #   * **:table** - Find table elements
  #     * Locator: id or caption text of table
  #     * Filters:
  #       * :id (String, Regexp, XPath::Expression) — Match id attribute of table
  #       * :caption (String) — Match text of associated caption
  #       * :class ((String, Array<String>, Regexp, XPath::Expression) — Matches the class(es) provided
  #       * :style (String, Regexp, Hash)
  #
  #   * **:frame** - Find frame/iframe elements
  #     * Locator: Match id or name
  #     * Filters:
  #       * :id (String, Regexp, XPath::Expression) — Match id attribute
  #       * :name (String) — Match name attribute
  #       * :class (String, Array<String>, Regexp, XPath::Expression) — Matches the class(es) provided
  #       * :style (String, Regexp, Hash)
  #
  #   * **:element**
  #     * Locator: Type of element ('div', 'a', etc) - if not specified defaults to '*'
  #     * Filters: Matches on any element attribute
  #

  class Selector < SimpleDelegator
    class << self
      def all
        @definitions ||= {} # rubocop:disable Naming/MemoizedInstanceVariableName
      end

      def [](name)
        all.fetch(name.to_sym) { |sel_type| raise ArgumentError, "Unknown selector type (:#{sel_type})" }
      end

      def add(name, **options, &block)
        all[name.to_sym] = Definition.new(name.to_sym, **options, &block)
      end

      def update(name, &block)
        self[name].instance_eval(&block)
      end

      def remove(name)
        all.delete(name.to_sym)
      end

      def for(locator)
        all.values.find { |sel| sel.match?(locator) }
      end
    end

    attr_reader :errors

    def initialize(definition, config:, format:)
      definition = self.class[definition] unless definition.is_a? Definition
      super(definition)
      @definition = definition
      @config = config
      @format = format
      @errors = []
    end

    def format
      @format || @definition.default_format
    end

    def enable_aria_label
      @config[:enable_aria_label]
    end

    def test_id
      @config[:test_id]
    end

    def call(locator, **options)
      if format
        raise ArgumentError, "Selector #{@name} does not support #{format}" unless expressions.key?(format)

        instance_exec(locator, options, &expressions[format])
      else
        warn 'Selector has no format'
      end
    ensure
      warn "Locator #{locator.inspect} must #{locator_description}. This will raise an error in a future version of Capybara." unless locator_valid?(locator)
    end

    def add_error(error_msg)
      errors << error_msg
    end

    def expression_for(name, locator, config: @config, format: format, **options)
      Selector.new(name, config: config, format: format).call(locator, **options)
    end

    # @api private
    def with_filter_errors(errors)
      old_errors = @errors
      @errors = errors
      yield
    ensure
      @errors = old_errors
    end

    # @api private
    def builder(expr = nil)
      case format
      when :css
        Capybara::Selector::CSSBuilder
      when :xpath
        Capybara::Selector::XPathBuilder
      else
        raise NotImplementedError, "No builder exists for selector of type #{default_format}"
      end.new(expr)
    end

  private

    def locator_description
      locator_types.group_by { |lt| lt.is_a? Symbol }.map do |symbol, types_or_methods|
        if symbol
          "respond to #{types_or_methods.join(' or ')}"
        else
          "be an instance of #{types_or_methods.join(' or ')}"
        end
      end.join(' or ')
    end

    def locator_valid?(locator)
      return true unless locator && locator_types

      locator_types&.any? do |type_or_method|
        type_or_method.is_a?(Symbol) ? locator.respond_to?(type_or_method) : type_or_method === locator # rubocop:disable Style/CaseEquality
      end
    end

    def locate_field(xpath, locator, **_options)
      return xpath if locator.nil?

      locate_xpath = xpath # Need to save original xpath for the label wrap
      locator = locator.to_s
      attr_matchers = [XPath.attr(:id) == locator,
                       XPath.attr(:name) == locator,
                       XPath.attr(:placeholder) == locator,
                       XPath.attr(:id) == XPath.anywhere(:label)[XPath.string.n.is(locator)].attr(:for)].reduce(:|)
      attr_matchers |= XPath.attr(:'aria-label').is(locator) if enable_aria_label
      attr_matchers |= XPath.attr(test_id) == locator if test_id

      locate_xpath = locate_xpath[attr_matchers]
      locate_xpath + XPath.descendant(:label)[XPath.string.n.is(locator)].descendant(xpath)
    end

    def find_by_attr(attribute, value)
      finder_name = "find_by_#{attribute}_attr"
      if respond_to?(finder_name, true)
        send(finder_name, value)
      else
        value ? XPath.attr(attribute) == value : nil
      end
    end

    def find_by_class_attr(classes)
      Array(classes).map { |klass| XPath.attr(:class).contains_word(klass) }.reduce(:&)
    end
  end
end

# rubocop:enable Style/AsciiComments

require 'capybara/selector/definition'
