class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261124.163407.dc0a102"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-163407-dc0a102/marvel-darwin-arm64"
    sha256 "ac53142fe961352a221e1d203741afabaeccec154fb36d83e1285637890d4e60"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-163407-dc0a102/marvel-darwin-amd64"
    sha256 "48700389af82138891e9ac34471bdff74f38373c84142d0dd6257667d15e61fc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-163407-dc0a102/marvel-linux-arm64"
    sha256 "8dff416d60a0aff48bd1c9773da272a25f9177c989e5b5b341d28377f9f9874a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-163407-dc0a102/marvel-linux-amd64"
    sha256 "e700bef55c433d666ee9e299a4e0180467512c78b9d4f95ef8ce2aded3871bd0"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
