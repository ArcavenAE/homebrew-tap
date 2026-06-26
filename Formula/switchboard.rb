class Switchboard < Formula
  desc "Low-latency encrypted tmux session router"
  homepage "https://github.com/arcavenae/switchboard"
  version "0.1.0-alpha.20260626.6521773"
  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260626-155536-6521773/switchboard-darwin-arm64"
    sha256 "8f789822a3dfb4aee3f4e17d115e5023a4a393cb00575b54a58cba7f13227adf"
  else
    url "https://github.com/arcavenae/switchboard/releases/download/alpha-20260626-155536-6521773/switchboard-darwin-amd64"
    sha256 "798dddc1a66338b06dd2232853eb491890ec9730038c4c8afef64a35ca784cfd"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "switchboard-darwin-arm64" : "switchboard-darwin-amd64"
    bin.install binary_name => "switchboard"
  end

  test do
    assert_match "switchboard", shell_output("#{bin}/switchboard --version 2>&1")
  end
end
