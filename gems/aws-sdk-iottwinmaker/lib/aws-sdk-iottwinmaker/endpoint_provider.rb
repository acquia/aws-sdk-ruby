# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

module Aws::IoTTwinMaker
  class EndpointProvider
    def initialize(rule_set = nil)
      @@rule_set ||= begin
        endpoint_rules = Aws::Json.load(Base64.decode64(RULES))
        Aws::Endpoints::RuleSet.new(
          version: endpoint_rules['version'],
          service_id: endpoint_rules['serviceId'],
          parameters: endpoint_rules['parameters'],
          rules: endpoint_rules['rules']
        )
      end
      @provider = Aws::Endpoints::RulesProvider.new(rule_set || @@rule_set)
    end

    def resolve_endpoint(parameters)
      @provider.resolve_endpoint(parameters)
    end

    # @api private
    RULES = <<-JSON
eyJ2ZXJzaW9uIjoiMS4wIiwicGFyYW1ldGVycyI6eyJSZWdpb24iOnsiYnVp
bHRJbiI6IkFXUzo6UmVnaW9uIiwicmVxdWlyZWQiOnRydWUsImRvY3VtZW50
YXRpb24iOiJUaGUgQVdTIHJlZ2lvbiB1c2VkIHRvIGRpc3BhdGNoIHRoZSBy
ZXF1ZXN0LiIsInR5cGUiOiJTdHJpbmcifSwiVXNlRHVhbFN0YWNrIjp7ImJ1
aWx0SW4iOiJBV1M6OlVzZUR1YWxTdGFjayIsInJlcXVpcmVkIjp0cnVlLCJk
ZWZhdWx0IjpmYWxzZSwiZG9jdW1lbnRhdGlvbiI6IldoZW4gdHJ1ZSwgdXNl
IHRoZSBkdWFsLXN0YWNrIGVuZHBvaW50LiBJZiB0aGUgY29uZmlndXJlZCBl
bmRwb2ludCBkb2VzIG5vdCBzdXBwb3J0IGR1YWwtc3RhY2ssIGRpc3BhdGNo
aW5nIHRoZSByZXF1ZXN0IE1BWSByZXR1cm4gYW4gZXJyb3IuIiwidHlwZSI6
IkJvb2xlYW4ifSwiVXNlRklQUyI6eyJidWlsdEluIjoiQVdTOjpVc2VGSVBT
IiwicmVxdWlyZWQiOnRydWUsImRlZmF1bHQiOmZhbHNlLCJkb2N1bWVudGF0
aW9uIjoiV2hlbiB0cnVlLCBzZW5kIHRoaXMgcmVxdWVzdCB0byB0aGUgRklQ
Uy1jb21wbGlhbnQgcmVnaW9uYWwgZW5kcG9pbnQuIElmIHRoZSBjb25maWd1
cmVkIGVuZHBvaW50IGRvZXMgbm90IGhhdmUgYSBGSVBTIGNvbXBsaWFudCBl
bmRwb2ludCwgZGlzcGF0Y2hpbmcgdGhlIHJlcXVlc3Qgd2lsbCByZXR1cm4g
YW4gZXJyb3IuIiwidHlwZSI6IkJvb2xlYW4ifSwiRW5kcG9pbnQiOnsiYnVp
bHRJbiI6IlNESzo6RW5kcG9pbnQiLCJyZXF1aXJlZCI6ZmFsc2UsImRvY3Vt
ZW50YXRpb24iOiJPdmVycmlkZSB0aGUgZW5kcG9pbnQgdXNlZCB0byBzZW5k
IHRoaXMgcmVxdWVzdCIsInR5cGUiOiJTdHJpbmcifX0sInJ1bGVzIjpbeyJj
b25kaXRpb25zIjpbeyJmbiI6ImF3cy5wYXJ0aXRpb24iLCJhcmd2IjpbeyJy
ZWYiOiJSZWdpb24ifV0sImFzc2lnbiI6IlBhcnRpdGlvblJlc3VsdCJ9XSwi
dHlwZSI6InRyZWUiLCJydWxlcyI6W3siY29uZGl0aW9ucyI6W3siZm4iOiJp
c1NldCIsImFyZ3YiOlt7InJlZiI6IkVuZHBvaW50In1dfV0sInR5cGUiOiJ0
cmVlIiwicnVsZXMiOlt7ImNvbmRpdGlvbnMiOlt7ImZuIjoiYm9vbGVhbkVx
dWFscyIsImFyZ3YiOlt7InJlZiI6IlVzZUZJUFMifSx0cnVlXX1dLCJlcnJv
ciI6IkludmFsaWQgQ29uZmlndXJhdGlvbjogRklQUyBhbmQgY3VzdG9tIGVu
ZHBvaW50IGFyZSBub3Qgc3VwcG9ydGVkIiwidHlwZSI6ImVycm9yIn0seyJj
b25kaXRpb25zIjpbXSwidHlwZSI6InRyZWUiLCJydWxlcyI6W3siY29uZGl0
aW9ucyI6W3siZm4iOiJib29sZWFuRXF1YWxzIiwiYXJndiI6W3sicmVmIjoi
VXNlRHVhbFN0YWNrIn0sdHJ1ZV19XSwiZXJyb3IiOiJJbnZhbGlkIENvbmZp
Z3VyYXRpb246IER1YWxzdGFjayBhbmQgY3VzdG9tIGVuZHBvaW50IGFyZSBu
b3Qgc3VwcG9ydGVkIiwidHlwZSI6ImVycm9yIn0seyJjb25kaXRpb25zIjpb
XSwiZW5kcG9pbnQiOnsidXJsIjp7InJlZiI6IkVuZHBvaW50In0sInByb3Bl
cnRpZXMiOnt9LCJoZWFkZXJzIjp7fX0sInR5cGUiOiJlbmRwb2ludCJ9XX1d
fSx7ImNvbmRpdGlvbnMiOlt7ImZuIjoiYm9vbGVhbkVxdWFscyIsImFyZ3Yi
Olt7InJlZiI6IlVzZUZJUFMifSx0cnVlXX0seyJmbiI6ImJvb2xlYW5FcXVh
bHMiLCJhcmd2IjpbeyJyZWYiOiJVc2VEdWFsU3RhY2sifSx0cnVlXX1dLCJ0
eXBlIjoidHJlZSIsInJ1bGVzIjpbeyJjb25kaXRpb25zIjpbeyJmbiI6ImJv
b2xlYW5FcXVhbHMiLCJhcmd2IjpbdHJ1ZSx7ImZuIjoiZ2V0QXR0ciIsImFy
Z3YiOlt7InJlZiI6IlBhcnRpdGlvblJlc3VsdCJ9LCJzdXBwb3J0c0ZJUFMi
XX1dfSx7ImZuIjoiYm9vbGVhbkVxdWFscyIsImFyZ3YiOlt0cnVlLHsiZm4i
OiJnZXRBdHRyIiwiYXJndiI6W3sicmVmIjoiUGFydGl0aW9uUmVzdWx0In0s
InN1cHBvcnRzRHVhbFN0YWNrIl19XX1dLCJ0eXBlIjoidHJlZSIsInJ1bGVz
IjpbeyJjb25kaXRpb25zIjpbXSwiZW5kcG9pbnQiOnsidXJsIjoiaHR0cHM6
Ly9pb3R0d2lubWFrZXItZmlwcy57UmVnaW9ufS57UGFydGl0aW9uUmVzdWx0
I2R1YWxTdGFja0Ruc1N1ZmZpeH0iLCJwcm9wZXJ0aWVzIjp7fSwiaGVhZGVy
cyI6e319LCJ0eXBlIjoiZW5kcG9pbnQifV19LHsiY29uZGl0aW9ucyI6W10s
ImVycm9yIjoiRklQUyBhbmQgRHVhbFN0YWNrIGFyZSBlbmFibGVkLCBidXQg
dGhpcyBwYXJ0aXRpb24gZG9lcyBub3Qgc3VwcG9ydCBvbmUgb3IgYm90aCIs
InR5cGUiOiJlcnJvciJ9XX0seyJjb25kaXRpb25zIjpbeyJmbiI6ImJvb2xl
YW5FcXVhbHMiLCJhcmd2IjpbeyJyZWYiOiJVc2VGSVBTIn0sdHJ1ZV19XSwi
dHlwZSI6InRyZWUiLCJydWxlcyI6W3siY29uZGl0aW9ucyI6W3siZm4iOiJi
b29sZWFuRXF1YWxzIiwiYXJndiI6W3RydWUseyJmbiI6ImdldEF0dHIiLCJh
cmd2IjpbeyJyZWYiOiJQYXJ0aXRpb25SZXN1bHQifSwic3VwcG9ydHNGSVBT
Il19XX1dLCJ0eXBlIjoidHJlZSIsInJ1bGVzIjpbeyJjb25kaXRpb25zIjpb
XSwidHlwZSI6InRyZWUiLCJydWxlcyI6W3siY29uZGl0aW9ucyI6W10sImVu
ZHBvaW50Ijp7InVybCI6Imh0dHBzOi8vaW90dHdpbm1ha2VyLWZpcHMue1Jl
Z2lvbn0ue1BhcnRpdGlvblJlc3VsdCNkbnNTdWZmaXh9IiwicHJvcGVydGll
cyI6e30sImhlYWRlcnMiOnt9fSwidHlwZSI6ImVuZHBvaW50In1dfV19LHsi
Y29uZGl0aW9ucyI6W10sImVycm9yIjoiRklQUyBpcyBlbmFibGVkIGJ1dCB0
aGlzIHBhcnRpdGlvbiBkb2VzIG5vdCBzdXBwb3J0IEZJUFMiLCJ0eXBlIjoi
ZXJyb3IifV19LHsiY29uZGl0aW9ucyI6W3siZm4iOiJib29sZWFuRXF1YWxz
IiwiYXJndiI6W3sicmVmIjoiVXNlRHVhbFN0YWNrIn0sdHJ1ZV19XSwidHlw
ZSI6InRyZWUiLCJydWxlcyI6W3siY29uZGl0aW9ucyI6W3siZm4iOiJib29s
ZWFuRXF1YWxzIiwiYXJndiI6W3RydWUseyJmbiI6ImdldEF0dHIiLCJhcmd2
IjpbeyJyZWYiOiJQYXJ0aXRpb25SZXN1bHQifSwic3VwcG9ydHNEdWFsU3Rh
Y2siXX1dfV0sInR5cGUiOiJ0cmVlIiwicnVsZXMiOlt7ImNvbmRpdGlvbnMi
OltdLCJlbmRwb2ludCI6eyJ1cmwiOiJodHRwczovL2lvdHR3aW5tYWtlci57
UmVnaW9ufS57UGFydGl0aW9uUmVzdWx0I2R1YWxTdGFja0Ruc1N1ZmZpeH0i
LCJwcm9wZXJ0aWVzIjp7fSwiaGVhZGVycyI6e319LCJ0eXBlIjoiZW5kcG9p
bnQifV19LHsiY29uZGl0aW9ucyI6W10sImVycm9yIjoiRHVhbFN0YWNrIGlz
IGVuYWJsZWQgYnV0IHRoaXMgcGFydGl0aW9uIGRvZXMgbm90IHN1cHBvcnQg
RHVhbFN0YWNrIiwidHlwZSI6ImVycm9yIn1dfSx7ImNvbmRpdGlvbnMiOltd
LCJlbmRwb2ludCI6eyJ1cmwiOiJodHRwczovL2lvdHR3aW5tYWtlci57UmVn
aW9ufS57UGFydGl0aW9uUmVzdWx0I2Ruc1N1ZmZpeH0iLCJwcm9wZXJ0aWVz
Ijp7fSwiaGVhZGVycyI6e319LCJ0eXBlIjoiZW5kcG9pbnQifV19XX0=

    JSON
  end
end
