;;; -*- coding:utf-8; lexical-binding: t;-*-
;;
;; Copyright (C) 2013-2026  Thierry Banel
;; 
;; org-aggregate is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;; 
;; org-aggregate is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;; 
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; ensure that the Org-ID in distant-tests.org
;; is available in the org-id-locations cache.
;; if it is already, do nothing.

(unless
    (and
     org-id-locations
     (cl-loop
      for file in (hash-table-values org-id-locations)
      thereis (string-match-p (rx "tests/distant-tests.org" eos)
                              file)))
  (org-id-update-id-locations '("distant-tests.org")))
