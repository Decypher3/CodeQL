/**
 * Provides models for the `NSURL` Swift class.
 */

import swift
private import codeql.swift.dataflow.ExternalFlow

/**
 * A model for `NSURL` members that permit taint flow.
 */
private class NsUrlSummaries extends SummaryModelCsv {
  override predicate row(string row) {
    row = ";NSURL;true;init(string:);(String);;Argument[0];ReturnValue.OptionalSome;taint"
  }
}
