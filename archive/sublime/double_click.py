import sublime
import sublime_plugin


class DoubleClickAtCaretCommand(sublime_plugin.TextCommand):
    """
    This command will emulate a double left click at the caret position(s).
    (If there is a selection, it will use the beginning of the selection.)
    To do this, it converts the caret position/offset to window coordinates.
    These coordinates are then passed along to the `drag_select` command, with
    the arguments that reflect a double left mouse click at said coordinates.
    
    Why is this useful? Because some functionality in ST is only implemented
    for double left clicking, like in the search or build results panel - there
    is no other command that can achieve the same thing. So, if you want to be
    able to keep your hands away from the mouse at all times, then this plug-in
    is your friend!
    """
    def run(self, edit, **kwargs):
        view = self.view
        # enumerate through each selection, while keeping a note of which index it is and looking up the window coordinates
        for idx, vector in enumerate(map(lambda sel: view.text_to_window(sel.begin()), view.sel())):
            # emulate a double click at those coordinates
            view.run_command('drag_select', {
                'event': {
                    'button': 1,
                    'count': 2,
                    'x': vector[0],
                    'y': vector[1]
                },
                'by': 'words',
                'additive': idx > 0 or kwargs.get('additive', False) # if there are multiple selections, act like pressing Ctrl while double clicking - otherwise we will end up with only one selection. The first double click should replace any existing selections unless told otherwise.
            })
