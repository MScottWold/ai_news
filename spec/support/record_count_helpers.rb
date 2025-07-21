# frozen_string_literal: true

module RecordCountHelpers
  # helpful for troubleshooting test set up and chaining factories

  OUTER_COLOR = "33"
  INNER_COLOR = "30"
  DIVIDER_LINE = "255"
  ZERO_COLOR = "246"
  NON_ZERO_COLOR = "40"
  TITLE_COLOR = "57"

  def show_record_count
    puts info_array
  end

  private

  def info_array
    [
      outer_line,
      colorized_string("Model: Count", TITLE_COLOR),
      inner_line,
      *colorized_counts,
      inner_line,
      outer_line,
    ]
  end

  def colorized_counts
    counts = record_counts
    zero_idx = counts.find_index { |_, n| n == 0 }

    counts.map! do |model, n|
      colorized_string(
        "#{model}: #{n}",
        n.zero? ? ZERO_COLOR : NON_ZERO_COLOR,
      )
    end

    if zero_idx.nil? || zero_idx.zero?
      counts
    else
      counts.insert(zero_idx, colorized_string("-", DIVIDER_LINE))
    end
  end

  def record_counts
    ApplicationRecord.descendants.map do |klass|
      [klass, klass.count]
    end.sort_by(&:second).reverse
  end

  def outer_line
    colorized_string("*" * 30, OUTER_COLOR)
  end

  def inner_line
    colorized_string("-" * 30, INNER_COLOR)
  end

  def colorized_string(string, color)
    "\e[38;5;#{color}m#{string}\e[0m"
  end
end
