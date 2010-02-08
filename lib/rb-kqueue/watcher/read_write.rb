module KQueue
  class Watcher
    # The {Watcher} subclass for events
    # fired when a stream can be read from or written to
    # (which of these is determined by \{#type}).
    # Read events are watched via {Queue#watch_for_read},
    # and write events are watched via {Queue#watch_for_write}.
    #
    # Note that read and write events for sockets
    # use the {SocketReadWrite} class.
    class ReadWrite < Watcher
      # The file descriptor for the stream being watched.
      #
      # @return [Fixnum]
      attr_reader :fd

      # The type of watcher, `:read` or `:write`.
      #
      # @return [Symbol]
      attr_reader :type

      # Creates a new read/write Watcher.
      #
      # @private
      def initialize(queue, fd, type, callback)
        @fd = fd
        @type = type
        super(queue, @fd, type, [], nil, callback)
      end
    end
  end
end
