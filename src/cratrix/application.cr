lib LibC
  struct ShadowPassword
    sp_namp   : Char*
    sp_pwdp   : Char*
    sp_lstchg : Long
    sp_min    : Long
    sp_max    : Long
    sp_warn   : Long
    sp_inact  : Long
    sp_expire : Long
    sp_flag   : ULong
  end

  fun getspnam(name : Char*) : ShadowPassword

  # struct spwd {
  #          char *sp_namp;     /* Login name */
  #          char *sp_pwdp;     /* Encrypted password */
  #          long  sp_lstchg;   /* Date of last change
  #                                (measured in days since
  #                                1970-01-01 00:00:00 +0000 (UTC)) */
  #          long  sp_min;      /* Min # of days between changes */
  #          long  sp_max;      /* Max # of days between changes */
  #          long  sp_warn;     /* # of days before password expires
  #                                to warn user to change it */
  #          long  sp_inact;    /* # of days after password expires
  #                                until account is disabled */
  #          long  sp_expire;   /* Date when account expires
  #                                (measured in days since
  #                                1970-01-01 00:00:00 +0000 (UTC)) */
  #          unsigned long sp_flag;  /* Reserved */
  #      };
  #
  #
  #    struct spwd *getspnam(const char *name);

end

sp = LibC.getspnam(ENV["USER"])
p sp
puts sp.sp_pwdp.value
exit

module Cratrix
  class Application

    def self.run
      new.run
    end

    @lock = false

    property lock

    def run
      window = Termbox::Window.new
      lines  = LineCollection.new(window)
      window.clear

      loop do
        # -- Event -----------------------------------------------------------------------------------------------------------
        event = window.peek(100)

        if event.type == Termbox::EVENT_KEY
          break if event.key != 0 || event.ch != 0
        end

        # -- Update ----------------------------------------------------------------------------------------------------------
        lines.update

        # -- Render ----------------------------------------------------------------------------------------------------------
        # window.clear
        lines.render
        window.render
      end

      window.shutdown
    end

  end
end
