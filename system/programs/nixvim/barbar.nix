{ pkgs, lib, ... }:

{
  programs.nixvim = {
    plugins = {
      barbar = {
        enable = true;
      };
    };

    keymaps = [
      {
        key = "<A-,>";
        action = "<cmd>BufferPrevious<cr>";
        mode = "n";
        options.silent = true;
      }
      {
        key = "<A-.>";
        action = "<cmd>BufferNext<cr>";
        mode = "n";
        options.silent = true;
      }
      {
        key = "<A-<>";
        action = "<cmd>BufferMovePrevious<cr>";
        mode = "n";
        options.silent = true;
      }
      {
        key = "<A->>";
        action = "<cmd>BufferMoveNext<cr>";
        mode = "n";
        options.silent = true;
      }

      {
        key = "<A-1>";
        action = "<cmd>BufferGoto 1<cr>";
        mode = "n";
        options.silent = true;
      }
      {
        key = "<A-2>";
        action = "<cmd>BufferGoto 2<cr>";
        mode = "n";
        options.silent = true;
      }
      {
        key = "<A-3>";
        action = "<cmd>BufferGoto 3<cr>";
        mode = "n";
        options.silent = true;
      }
      {
        key = "<A-4>";
        action = "<cmd>BufferGoto 4<cr>";
        mode = "n";
        options.silent = true;
      }
      {
        key = "<A-5>";
        action = "<cmd>BufferGoto 5<cr>";
        mode = "n";
        options.silent = true;
      }
      {
        key = "<A-6>";
        action = "<cmd>BufferGoto 6<cr>";
        mode = "n";
        options.silent = true;
      }
      {
        key = "<A-7>";
        action = "<cmd>BufferGoto 7<cr>";
        mode = "n";
        options.silent = true;
      }
      {
        key = "<A-8>";
        action = "<cmd>BufferGoto 8<cr>";
        mode = "n";
        options.silent = true;
      }
      {
        key = "<A-9>";
        action = "<cmd>BufferGoto 9<cr>";
        mode = "n";
        options.silent = true;
      }
      {
        key = "<A-0>";
        action = "<cmd>BufferLast<cr>";
        mode = "n";
        options.silent = true;
      }
    ];
  };
}
