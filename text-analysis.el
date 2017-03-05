(defun start-analysis-wc (path &rest tasks))

(defun word-count-for-task (path &rest tasks)
  "count words in a given path using dolist"
  (with-temp-buffer
    (insert-file-contents path)
    (let ((task-count 0))
      (dolist (task tasks task-count)
        (setq task-count (+ task-count
                            (count-matches task
                                           (point-min)
                                           (point-max))))))))

(type-of (word-count-for-task "/Users/tom-liang/Documents/scripts/test_color.py"
                              "import" "print"))

(word-count-for-task "/Users/tom-liang/Documents/scripts/test_color.py"
                     "import" "print")

(defun word-count-for-task (path &rest tasks)
  "count words in a given path using while"
  (with-temp-buffer
    (insert-file-contents path)
    (let ((task-count 0))
      (while tasks
        (let ((count (count-matches (car tasks)
                                    (point-min)
                                    (point-max))))
          (setq task-count (+ task-count count))
          (setq tasks (cdr tasks))))
      task-count)))

(write-file "/Users/tom-liang/Documents/xxxx.el"
            nil)
(append-to-buffer)
(insert-string "add more stuff")

(progn
  (let ((message-buffer-name (lambda ()
                               (message (buffer-name (current-buffer))))))
    (funcall message-buffer-name)
    ;; (apply message-buffer-name)
    (with-current-buffer "elisp"
      (funcall message-buffer-name))
    (funcall message-buffer-name)
    "end"))

(progn
  (let ((output-buffer (get-buffer-create "analysis_ouput"))
        (input-path "/Users/tom-liang/Documents/scripts/test-color-for-emacs.py"))
    (with-current-buffer output-buffer
      (insert-string (concat input-path)
                     " "
                     (word-count-for-task input-path "import")))))
;; main
(progn
  (let ((output-buffer (get-buffer-create "analysis_ouput"))
        (input-path "/Users/tom-liang/Documents/scripts/test-color-for-emacs.py"))
    (with-temp-file input-path
      (insert-file-contents input-path)
      (>= (word-count-for-tasks "import") 2)
      (replace-string "import" "IMPORT")))))

(defun word-count-for-tasks (&rest tasks)
  "count words in a given path using while"
  (let ((task-count 0))
    (while tasks
      (let ((count (count-matches (car tasks)
                                  (point-min)
                                  (point-max))))
        (setq task-count (+ task-count count))
        (setq tasks (cdr tasks))))
    task-count))
